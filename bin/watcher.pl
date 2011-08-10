#!/usr/bin/perl
use strict;
use warnings;
use App::MadEye;

my $config = +{
    global => {
        logger => [
            +{
                class  => 'Screen',
                config => {
                    name      => 'screen',
                    min_level => 'debug',
                    stderr    => 1,
                }
            }
        ],
    },
    plugins => [
        +{
            module => 'Check::Network',
            config =>
              { urls => +[ 'http://livedoor.com/', 'http://google.com/', ] },
        },
        +{
            module => 'Worker::Simple',
            config => +{ task_timeout => 10, }
        },
        +{
            module => 'Agent::HTTP',
            config => {
                timeout => 6,
                target  => [
                    'http://64p.org/',    'http://frepan.org/',
                    'http://xslate.org/', 'http://ljkdlsjaflfvedoor.com/'
                ],
                user_agent => 'nothing',
            },
            rule => [
                +{
                    module => 'Retry',
                    config => +{
                        expire_time => 10 * 60,
                        cache_root  => '/tmp/madeye',
                    }
                }
            ]
        },
        +{ module => 'Notify::Debug', },
        +{
            module => 'Notify::Email',
            config => {
                from_addr => 'tokuhirom@gmail.com',
                to_addr   => 'tokuhirom@gmail.com',
            }
        },
    ],
};

App::MadEye->new({config => $config})->run;

