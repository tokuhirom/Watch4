use inc::Module::Install;
use Module::Install::AuthorTests;

name 'Watch4';
all_from 'lib/Watch4.pm';

requires 'App::MadEye';
requires 'LWP::Protocol::https';
requires 'LWP::UserAgent';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More' => 0.96; # done_testing, subtest

author_tests('xt');
WriteAll;
