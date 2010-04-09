require File.join(File.dirname(__FILE__), '..', 'lib', 'rsolr')

# switch out the http adapter from net_http to curb
solr = RSolr.connect :adapter=>:curb

Dir['../apache-solr/example/exampledocs/*.xml'].each do |xml_file|
  puts "Updating with #{xml_file}"
  solr.update File.read(xml_file)
end

solr.commit

puts

response = solr.select(:q=>'ipod', :fq=>['price:[0 TO 50]'], :rows=>2, :start=>0)

puts "URL : #{response.adapter_response[:url]} -> #{response.adapter_response[:status_code]}"

puts

response['response']['docs'].each do |doc|
  puts doc['timestamp']
end

solr.delete_by_query('*:*') and solr.commit