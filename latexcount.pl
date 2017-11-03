#!/usr/bin/perl -n

# latexcount
# ver 1.1
# 2003ii28

# a script for counting words in LaTeX documents
# by P.D. Magnus <http://www.fecundity.com/pmagnus>

# The script runs from the command line:
# >perl latexcount.pl foo.tex

# The only tags that are not counted are those explicitly
# mentioned in the cutlist. If there are substantal tags
# that you'd like not to be counted, add them to the list.

BEGIN {
	%cutlist = (
		'begin' => 1,
		'end' => 1,
		'usepackage' => 1,
		'addtolength' => 1,
		'documentclass' => 1,
		'author' => 1,
		'title' => 1,
		'chapter' => 1,
		'bibliography' => 1,
		'bibliographystyle' => 1,
		'section' => 1,
		'subsection' => 1,
		'subsubsection' => 1,
		'thanks' => 1,
		'pagestyle' => 1,
	);
	my $line = '';
	my $cumline = '';
	my $depth = 0;
	my $words = 0;
	my $fnwords = 0;
	my $i = 0;
	my @tags = ();
	my $thistag = '';
}

# Take a hunk of the input file.

# Using the -n argument, the script runs for while (<>);
# that is, it runs through every line of the input file.


	$line = $_;
	
	# Regularize line endings
	$line =~ s/\r/\n/g;
	
	# Remove comments
	$line =~ s/(?<!\\)%.*?\n//g;
	
	# Count curly braces
	while($line =~ /\{/g){$depth++}
	while($line =~ /\}/g){$depth--}
	
	# Concatenate the new hunk of input to any
	# left over from previous cycles.
	
	$cumline .= $line;
	
	
	# If the number of {'s matches the number of }'s in
	# the hunk collected so far, eliminate tags and
	# count words.
	if ($depth == 0) {
		# Eliminate all tags, and eliminate the contents
		# of tags on the cut list.
		
		# Replace the most deeply nested tag/argument pair
		# '\foo{bar}' with '<0<bar>0>' and puts 'foo'
		# in the list @tags; the nth tag is replaced with
		# '<n<bar>n>', etc.
		while($cumline =~ s/(\\\w+)?\s*\{([^\{\}]*)\}/<"$i"<$2>"$i">/s){push @tags, $1; $i++;}

		# Look through the list @tags, starting with the
		# outermost tag/argument pair.
		$i = 0;
		while($#tags >= 0){
			$thistag = shift @tags;
			$thistag =~ s/\\//;
			if ($thistag eq 'footnote') {
				# Footnotes are counted separately.
				$cumline =~ s/<"$i"<(.*)>"$i">//s;
				$line = $1;
				while($line =~ /\b\w+\b/g){$fnwords++};
			} elsif (defined($cutlist{$thistag})) {
				# The arguments of these tags are removed.
				$cumline =~ s/<"$i"<.*>"$i">//s;
			} else {
				# The arguments of other tags are left in.
				$cumline =~ s/<"$i"<(.*)>"$i">/$1/s;
			};
			$i++;
		}
		
		# Remove any tags that weren't part of tag/argument
		# pairs.
		$cumline =~ s/\\\w+//g;
		
		
		# Count the remaining words in the present bit of text.
		while($cumline =~ /\b\w+\b/g){$words++}
		$cumline = '';
		$i = 0;
	}

END{
	print "\n$words words in the main text\n$fnwords in the footnotes\n";
	print ($words+$fnwords);
	print " total\n\n";
}