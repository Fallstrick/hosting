import 'dart:io' as io;
/// [ContentType] for response ContentType
abstract class ContentType {
  /// Content type for plain text using UTF-8 encoding.
  ///
  ///   text/plain; charset=utf-8
  ///
  static const text =  'text';
  ///  Content type for HTML using UTF-8 encoding.
  ///
  ///     text/html; charset=utf-8
  static const html =  'html';
  ///  Content type for JSON using UTF-8 encoding.
  ///
  ///     application/json; charset=utf-8
  ///
  static const json = 'json';
  ///  Content type for binary data.
  ///
  ///     application/octet-stream
  ///
  static const binary = 'binary';
}
