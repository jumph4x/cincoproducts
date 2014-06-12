desc 'recalc image dimensions'
task :reprocess => :environment do
  Spree::Image.find_each { |u| u.attachment.reprocess! }
end
