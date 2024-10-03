module Jekyll
    module BibliographyFilters
      require 'bibtex'
  
      def categorize_bibliography(entries)
        categorized = {}
  
        entries.each do |entry|
          type = entry['type']
          year = entry['year']
  
          categorized[type] ||= []
          categorized[type] << entry
        end
  
        categorized.each do |type, entries|
          entries.sort_by! { |entry| -entry['year'].to_i }
        end
  
        categorized
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::BibliographyFilters)
  