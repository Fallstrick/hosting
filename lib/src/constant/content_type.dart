import 'dart:io' as io;
/// [ContentType] for response ContentType
abstract class ContentType {
  /// Content type for plain text using UTF-8 encoding.
  ///
  ///   text/plain; charset=utf-8
  ///
  static final text = io.ContentType('text', 'plain', charset: 'utf-8');
  ///  Content type for HTML using UTF-8 encoding.
  ///
  ///     text/html; charset=utf-8
  static final html = io.ContentType('text', 'html', charset: 'utf-8');
  ///  Content type for JSON using UTF-8 encoding.
  ///
  ///     application/json; charset=utf-8
  ///
  static final json = io.ContentType('application', 'json', charset: 'utf-8');
  ///  Content type for binary data.
  ///
  ///     application/octet-stream
  ///
  static final binary = io.ContentType('application', 'octet-stream');
}
