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

  MaxLength(this.constraint, this.message);
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

  MinLength(this.constraint, this.message);
}

class Between implements IValidator {
  final int min;
  final int max;
  final String message;

  call(String value) {
    if (value.length < this.min || value.length > this.max) {
      return true;
    }
    return false;
  }

  Between(this.message, {this.max, this.min});
}

// class Composs implements IValidator {
//   final int min;
//   final int max;
//   final String message;

//   call(String value) {
//     if (value.length < this.min || value.length > this.max) {
//       return true;
//     }
//     return false;
//   }

  // Composs(this.message, ...);
// }

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
//   static min(min: number): ValidatorFn
//   static max(max: number): ValidatorFn
//   static required(control: AbstractControl): ValidationErrors | null
//   static requiredTrue(control: AbstractControl): ValidationErrors | null
//   static email(control: AbstractControl): ValidationErrors | null
//   static minLength(minLength: number): ValidatorFn
//   static maxLength(maxLength: number): ValidatorFn
//   static pattern(pattern: string | RegExp): ValidatorFn
//   static nullValidator(control: AbstractControl): ValidationErrors | null
//   static compose(validators: ValidatorFn[]): ValidatorFn | null
//   static composeAsync(validators: AsyncValidatorFn[]): AsyncValidatorFn | null
// }