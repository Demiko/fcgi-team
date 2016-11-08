#!/usr/bin/perl

print "Content-type:text/html\n\n";
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
