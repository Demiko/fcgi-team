#!/usr/bin/perl


#use strict;
#use warnings;
use FCGI;
use POSIX;

my $socket = FCGI::OpenSocket(":8999", 5);
my $count = 1;
my $request = FCGI::Request(\*STDIN, \*STDOUT, \*STDERR, \%ENV, $socket);
my $startTime=time();

while($request->Accept() >= 0) {
        
        
        my $elapsed =time()-$startTime;
        my $hours = floor(($elapsed/3600)%24);
        my $minutes =floor(($elapsed/60)%60);
        my $seconds = ($elapsed)%60;
        my $days =floor($elapsed/(3600*24));

        my $parse ="$days days $hours  hoours $minutes minutes $seconds seconds ";

        print "Content-type:text/html\n\n";
        foreach $key (sort(keys %ENV)) {
                print "$key = $ENV{$key}<br>\n";
        }


        print $parse;


        print <<EndOfHTML;
        <html><head><title>Perl Environment Variables</title></head>
                <body>
                <h1>1. Number of users on the website</h1>
                <h1>2. Number of users in the last hour</h1>
                <h1>3. Number of users in the last 24 hours</h1>
                <h1>4. 10 last useragents</h1>
                <h1>5. App on-line</h1>
                <h1>6. Query counter</h1>
                <b>7. Depending on the domain bold the appropriate task</b> 
EndOfHTML
                print "</body></html>";
}
FCGI::CloseSocket($socket);

