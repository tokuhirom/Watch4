use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Watch4',
    AUTHOR       => 'Tokuhiro Matsuno <tokuhirom@gmail.com>',
    VERSION_FROM => 'lib/Watch4.pm',
    PREREQ_PM    => {
        'App::MadEye'          => 0,
        'LWP::Protocol::https' => 0,
        'LWP::UserAgent'       => 0,
        'MIME::Lite'           => 0,
    },
    MIN_PERL_VERSION => '5.008001',
    ( -d 'xt' and $ENV{AUTOMATED_TESTING} || $ENV{RELEASE_TESTING} )
    ? ( test => { TESTS => 't/*.t xt/*.t', }, )
    : (),
);
