require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Pcntl < AbstractPhp55Extension
  init
  homepage 'http://php.net/manual/en/book.pcntl.php'
  url 'http://www.php.net/get/php-5.5.0.tar.bz2/from/this/mirror'
  sha1 '63126ef43e45adfcb2dd19590a4fb88da3c6d280'
  version '5.5.0'

  def install
    Dir.chdir "ext/pcntl"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--disable-dependency-tracking"
    system "make"
    prefix.install "modules/pcntl.so"
    write_config_file unless build.include? "without-config-file"
  end
end
