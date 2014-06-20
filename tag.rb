#!/usr/bin/ruby -w
# Determine a unique substring (k-mer) of each string
# Copyright 2014 Shaun Jackman

k=7

class String
  # Iterate over each k-mer
  def each_kmer k
    return enum_for(:each_kmer, k) unless block_given?
    (0 .. length - k).each { |i|
      yield self[i, k]
    }
  end
end

class Array
  # Add a unique suffix to duplicate strings
  def dedup
    counts = each_with_object(Hash.new(0)) { |x, memo|
      memo[x] += 1
    }
    each_with_object(Hash.new(0)).map { |x, dups|
      x + ("-#{dups[x] += 1}" if counts[x] > 1).to_s
    }
  end
end

# Count the k-mers in a set of strings
def count_kmer seqs, k
  seqs.each_with_object(Hash.new(0)) { |seq, counts|
    seq.each_kmer(k).to_a.uniq.each { |kmer|
      counts[kmer] += 1
    }
  }
end

# Return the unique tag of the specified string
def get_tag seq, kmer_counts, k
  return seq if seq.length < k
  seq.each_kmer(k).map { |kmer|
    [kmer_counts[kmer], kmer]
  }.min[1]
end

# Read strings and write unique tags
seqs = ARGF.each_line.map{ |s| s.chomp.upcase }.to_a
kmer_counts = count_kmer seqs, k
puts seqs.map { |seq| get_tag(seq, kmer_counts, k) }.dedup
