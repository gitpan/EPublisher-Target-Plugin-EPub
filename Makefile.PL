
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Use EPub as a target for EPublisher",
  "AUTHOR" => "Renee B\303\244cker <module\@renee-baecker.de>, Boris D\303\244ppen <boris_daeppen\@bluewin.ch>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "EPublisher-Target-Plugin-EPub",
  "EXE_FILES" => [],
  "LICENSE" => "artistic_2",
  "NAME" => "EPublisher::Target::Plugin::EPub",
  "PREREQ_PM" => {
    "Data::UUID" => "1.217",
    "EBook::EPUB" => "0.6",
    "EPublisher" => "0.6",
    "File::Basename" => 2,
    "File::Temp" => 0,
    "Pod::Simple::XHTML" => "3.14"
  },
  "VERSION" => "0.1",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



