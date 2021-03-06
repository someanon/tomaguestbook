package Toma::Captcha;

use v5.12.4;
use utf8;

use Exporter::Easy (
  EXPORT => [qw(generate_captcha check_captcha)],
);

use Toma::Config;

use Authen::Captcha;

my $ch = Authen::Captcha->new(
  data_folder => './data',
  output_folder => './public/captcha',
  salt => $cfg->{'captcha.salt'},
);

sub generate_captcha() {
  return $ch->generate_code($cfg->{'captcha.length'});
}

sub check_captcha($$) {
  my( $md5sum, $captcha ) = @_;
  return $ch->check_code($captcha, $md5sum) > 0 ? 1 : 0;
}
