#!/usr/bin/env ruby
#-*- coding:utf-8 -*-

ENV["RAILS_ENV"] = ENV["RAILS_ENV"] || "development"
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require "iconv"

def read_doc_and_insertdb(path)
  Dir.open(path).each do |filename|
    full_filename = File.expand_path(filename, path)
    unless filename == "." or filename == ".."
      if File.directory?(full_filename)
        read_doc_and_insertdb(full_filename)
      elsif File.file?(full_filename)
        if File.extname(full_filename) == "" or File.extname(full_filename) == ".txt"
          text_doc = doc_title_and_content(full_filename)
          puts "#{full_filename} : #{text_doc[:title]}"
          doc = Doc.new(:title => text_doc[:title],
                        :content => text_doc[:content])
          doc.save!
        end
      end
    end
  end 
end

def doc_title_and_content(filepath)
  title = ""
  content = []
  File.open(filepath) do |f|
    f.each_line do |line|
      begin
        title = Iconv::iconv("utf8", "euckr", line).to_s.strip if title.strip == ""
        content << Iconv::iconv("utf8", "euckr", f.read).to_s
      rescue
        content << f.read.to_s
      end
    end
  end
  { :title => title, :content => content.join("").to_s }
end


doc_path = "/home/eunchul/docs/KLDP"
read_doc_and_insertdb(doc_path)

