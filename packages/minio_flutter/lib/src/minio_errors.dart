import 'package:minio_flutter/models.dart';
import 'package:minio_flutter/src/minio_client.dart';
import 'package:minio_flutter/src/minio_helpers.dart';

class MinioError implements Exception {
  MinioError(this.message);

  final String? message;

  @override
  String toString() {
    return 'MinioError: $message';
  }
}

class MinioAnonymousRequestError extends MinioError {
  MinioAnonymousRequestError(String super.message);
}

class MinioInvalidArgumentError extends MinioError {
  MinioInvalidArgumentError(String super.message);
}

class MinioInvalidPortError extends MinioError {
  MinioInvalidPortError(String super.message);
}

class MinioInvalidEndpointError extends MinioError {
  MinioInvalidEndpointError(String super.message);
}

class MinioInvalidBucketNameError extends MinioError {
  MinioInvalidBucketNameError(String super.message);

  static void check(String bucket) {
    if (isValidBucketName(bucket)) return;
    throw MinioInvalidBucketNameError('Invalid bucket name: $bucket');
  }
}

class MinioInvalidObjectNameError extends MinioError {
  MinioInvalidObjectNameError(String super.message);

  static void check(String object) {
    if (isValidObjectName(object)) return;
    throw MinioInvalidObjectNameError('Invalid object name: $object');
  }
}

class MinioAccessKeyRequiredError extends MinioError {
  MinioAccessKeyRequiredError(String super.message);
}

class MinioSecretKeyRequiredError extends MinioError {
  MinioSecretKeyRequiredError(String super.message);
}

class MinioExpiresParamError extends MinioError {
  MinioExpiresParamError(String super.message);
}

class MinioInvalidDateError extends MinioError {
  MinioInvalidDateError(String super.message);
}

class MinioInvalidPrefixError extends MinioError {
  MinioInvalidPrefixError(String super.message);

  static void check(String prefix) {
    if (isValidPrefix(prefix)) return;
    throw MinioInvalidPrefixError('Invalid prefix: $prefix');
  }
}

class MinioInvalidTagsError extends MinioError {
  MinioInvalidTagsError(String super.message);

  static void check(Tags tags) {
    if (!isValidTagSize(tags.length())) {
      throw MinioInvalidTagsError('Only $maxTags object tags allowed.');
    }
    if (tags.tagSet != null) {
      tags.tagSet?.forEach((key, value) {
        if (!isValidTagName(key!)) {
          throw MinioInvalidTagsError('Invalid tag key: $key');
        }
        if (!isValidTagName(value!)) {
          throw MinioInvalidTagsError('Invalid tag value: $value');
        }

      });      
    }
  }
}

class MinioInvalidBucketPolicyError extends MinioError {
  MinioInvalidBucketPolicyError(String super.message);
}

class MinioIncorrectSizeError extends MinioError {
  MinioIncorrectSizeError(String super.message);
}

class MinioInvalidXMLError extends MinioError {
  MinioInvalidXMLError(String super.message);
}

class MinioS3Error extends MinioError {
  MinioS3Error(super.message, [this.error, this.response]);

  Error? error;

  MinioResponse? response;
}
