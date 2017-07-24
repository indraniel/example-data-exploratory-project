#!/usr/bin/perl

use warnings;
use strict;

use Genome::File::Vcf::Reader;
use Genome::File::Vcf::Entry;

my ($build, $vcf) = @ARGV;
my $reader = Genome::File::Vcf::Reader->new($vcf);

my %filter_type = ();
my $total = 0;
while (my $entry = $reader->next) {
    my $filters =  $entry->sample_field(0, 'FT') || 'PASS';
    $filter_type{$filters}++;
    $total++;
}

my @sorted_keys = sort keys %filter_type;
print join("\t", 'build_id',  @sorted_keys), "\n";
print join("\t", $build, map { $filter_type{$_} } @sorted_keys), "\n";
