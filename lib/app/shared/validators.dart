class Required implements IValidator {
  final String message;
  call(String value) => value.isEmpty;
  Required([this.message = '']);
}

class MaxLength implements IValidator {
  final int constraint;
  final String message;
  call(String value) {
    if (value.length > this.constraint) {
      return true;
    }
    return false;
  }

  MaxLength(this.constraint, [this.message]);
}

class MinLength implements IValidator {
  final int constraint;
  final String message;
  call(String value) {
    if (value.length < this.constraint) {
      return true;
    }
    return false;
  }

  MinLength(this.constraint, [this.message]);
}

class Between implements IValidator {
  final MinLength minLength;
  final MaxLength maxLength;
  final String message;

  call(String value) {
    if (this.maxLength(value) || this.minLength(value)) {
      return true;
    }
    return false;
  }

  Between(this.message, {max, min})
      : this.maxLength = MaxLength(max, message),
        this.minLength = MinLength(min, message);
}

class Composs implements IValidator {
  final String message;
  final List<IValidator> validators;
  call(String value) {
    for (var validator in this.validators) {
      if (validator(value)) {
        return true;
      }
    }
    return false;
  }

  Composs(this.message, this.validators);
}

class Email implements IValidator {
  final Pattern pattern;
  final String message;
  call(String value) => this.pattern(value);
  Email([this.message = ''])
      : this.pattern = Pattern(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+") {
  }
}

class Pattern implements IValidator {
  final RegExp regexp;
  final String message;
  call(String value) => !this.regexp.hasMatch(value);
  Pattern(pattern, [this.message = '']) : this.regexp = RegExp(pattern);
}

class IValidator {
  final String message;
  IValidator(this.message);
  call(String value) => bool;
}

validate(List<IValidator> validators) {
  return (String value) {
    for (var validator in validators) {
      if (validator(value)) {
        return validator.message;
      }
    }
    return null;
  };
}

// class Validators {
//   STUB static required(control: AbstractControl): ValidationErrors | null
//   STUB static email(control: AbstractControl): ValidationErrors | null
//   STUB static minLength(minLength: number): ValidatorFn
//   STUB static maxLength(maxLength: number): ValidatorFn
//   STUB static compose(validators: ValidatorFn[]): ValidatorFn | null
//   STUB static pattern(pattern: string | RegExp): ValidatorFn
//   static min(min: number): ValidatorFn
//   static max(max: number): ValidatorFn
//   REVIEW static requiredTrue(control: AbstractControl): ValidationErrors | null
//   REVIEW static nullValidator(control: AbstractControl): ValidationErrors | null
//   REVIEW static composeAsync(validators: AsyncValidatorFn[]): AsyncValidatorFn | null
// }
