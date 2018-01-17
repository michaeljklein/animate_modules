#!/bin/ruby

require 'fileutils'
require 'tmpdir'



def check_out_and_graph_each(repo_shas, num_repo_shas, repo_dir)
  last_graph_name = nil

  repo_shas.each_with_index do |repo_sha, i|
    puts "Checking out: #{repo_sha}, #{i}/#{num_repo_shas}"
    FileUtils.cd(repo_dir) do
      system "git checkout #{repo_sha} ."
    end

    graph_name = "animate_modules_#{repo_sha}_#{i}.dot"

    puts "Building graph: #{graph_name}"
    system "find #{repo_dir} -name '*.hs' | xargs graphmod -q > #{graph_name}"

    if !last_graph_name.nil? && File.read(graph_name).casecmp(File.read(last_graph_name)) == 0
      puts "graph was duplicate"
      FileUtils.rm_f graph_name
    else
      puts "rendering graph"
      system "dot -Tgif #{graph_name} -o #{graph_name.sub(/dot$/, 'gif')}"

      last_graph_name = graph_name
    end
  end
end


def convert_to_gif(num_repo_shas, goal_time_seconds=30)
  puts "Making the gif:"

  ms_delay = (goal_time_seconds * 1000) / num_repo_shas

  puts "Calculated a delay of #{ms_delay} ms, with goal time of #{goal_time_seconds} s for the gif"
  puts
  puts "Note: even though there are #{num_repo_shas} shas, there are only #{Dir['*.dot'].length} unique graphs"

  system "convert -delay #{ms_delay} -loop 0 animate_modules_*.gif animated_modules_out.gif"
end


def make_gif(to_clone, out_dir=`pwd`.chomp, out_filename=nil, temp_dir=nil)
  need_temp_dir = if temp_dir.nil?
    temp_dir = Dir.mktmpdir
  end

  begin
    FileUtils.cd(temp_dir) do
      system "git clone #{to_clone}"

      repo_temp_dir = Dir['*/'].first

      FileUtils.cd repo_temp_dir
      repo_shas     = `git log --pretty=format:'%H'`.lines.map(&:chomp)
      num_repo_shas = repo_shas.length
      FileUtils.cd '..'

      check_out_and_graph_each repo_shas, num_repo_shas, repo_temp_dir

      convert_to_gif num_repo_shas, 5 # (seconds is goal time for gif)

      out_file      = out_filename&.+('.gif')&.sub(/(\.gif)+/, '.gif') || "animated_modules_#{to_clone.gsub(/\W+/, '_')}.gif"
      out_file_path = "#{out_dir}/#{out_file}"
      FileUtils.cp "animated_modules_out.gif", out_file_path

      puts "Result filename:"
      puts out_file

      puts "Copied results to:"
      puts out_file_path
    end
  ensure
    if need_temp_dir
      FileUtils.remove_entry temp_dir
    end
  end
end


puts "Checking dependencies:"

unless system('which graphmod') && system('which dot')
  puts "Error, graphmod or dot not found:"
  puts
  puts "Uses graphmod: https://hackage.haskell.org/package/graphmod"
  puts "stack install graphmod"
  puts
  puts "Uses dot: www.graphviz.org"
  puts "brew install graphviz"
  exit
end


args = ARGV.to_a

args_ref = [ "  0. to_clone     (required)",
             "  1. out_dir      (default is '.')",
             "  2. out_filename (default is \"animated_modules_\#{to_clone.gsub(/\W+/, '_')}.gif\"",
             "  3. temp_dir     (default is random-ish)"
]

if args.length == 0
  puts "animate_modules.rb: the first argument must be the repository to clone"
  puts
  puts args_ref
elsif args.length > 4
  puts "four arguments at most:"
  puts
  puts args_ref
else
  puts "Args reference:"
  puts
  args_ref.zip(args).each{|x| puts x}

  make_gif(*args)
end

