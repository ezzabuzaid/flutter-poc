import 'dart:convert';

import 'package:http_interceptor/http_interceptor.dart';
// NOTE get this from environment

class LogginInterceptor implements InterceptorContract {
  Map logging = Map<String, int>();
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    int started = DateTime.now().millisecond;
    logging[data.url] = started;
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // NOTE you need to ser id for each request in order to obtain the starter time
    // data.url will not work since we change it in url interceptor

    // int elapsed = DateTime.now().millisecond - int.parse(logging[data.url]);
    print('Request for ${data.url} took ${logging[data.url]} ms.');
    logging.remove(data.url);
    return data;
  }
}

class UrlInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(Uri.http('10.0.2.2', '/api/${data.url}').toString());
    data.url = Uri.http('10.0.2.2:8080', '/api/${data.url}').toString();
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }
}

class ErrorInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // data.url = '$ENDPOINT_URI/${data.url}';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}

class MutationInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // data.body = json.decode(data.body);
    return data;
  }
}

// نحن نكتب لكي نغزل من الحروف عباءة تقينا زمهرير الواقع
//  تحملنا على بساط من خيال, نحن نكتب لكي نشرب الحبر اذ نعطش و نلتهم الورق اذ نجوع نحن نكتب لكي نستحق الوجود في هذا الكون لكي نرمم الخلل بداخلنا و من حولنا نحن نكتب لكي نَنسى و لا نُنسى

/* سنكون يوماً ما ذكرةً ﻷحدهما ربما ساكون انا او `انا` لا احد يعلم
 لكن حقيقة الأمر انه لطالما لم يكن تحت مظلة الحقيقة إلى اننا نكتب لأننا نحب ما نكتب عنه
 يقال ايضا هنا و كفى!
*/
