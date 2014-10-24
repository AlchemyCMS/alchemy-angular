module AlchemyAngular
  module Generators
    class TemplatesGenerator < Rails::Generators::Base
      desc "Generates Angular templates for your Alchemy elements, cells and pages."
      source_root File.expand_path('templates', File.dirname(__FILE__))

      def create_page_template
        @page_dir = "#{Rails.root}/app/assets/javascripts/#{templates_path_prefix}alchemy"
        empty_directory @page_dir
        template 'page.html', "#{@page_dir}/page.html"
      end

      def create_directory
        @elements_dir = "#{Rails.root}/app/assets/javascripts/#{templates_path_prefix}alchemy/elements"
        @cells_dir = "#{Rails.root}/app/assets/javascripts/#{templates_path_prefix}alchemy/cells"
        empty_directory @elements_dir
        empty_directory @cells_dir
      end

      def create_element_partials
        @elements = load_alchemy_yaml('elements.yml')
        @elements.each do |element|
          @element = element
          contents = element["contents"] || []
          if @element['available_contents']
            @available_contents_names = @element['available_contents'].collect { |c| c['name'] }
            @contents = contents.delete_if { |c| @available_contents_names.include?(c['name']) } or []
          else
            @contents = contents
          end
          if element["name"] =~ /\A[a-z0-9_-]+\z/
            @element_name = element["name"].underscore
          else
            raise "Element name '#{element['name']}' has wrong format. Only lowercase and non whitespace characters allowed."
          end

          template "element.html", "#{@elements_dir}/#{@element_name}.html"
        end if @elements
      end

      def create_cell_partials
        @cells = load_alchemy_yaml('cells.yml')
        @cells.each do |cell|
          @cell = cell
          @elements = cell["elements"] || []
          if cell["name"] =~ /\A[a-z0-9_-]+\z/
            @cell_name = cell["name"].underscore
          else
            raise "Cell name '#{cell['name']}' has wrong format. Only lowercase and non whitespace characters allowed."
          end

          template "cell.html", "#{@cells_dir}/#{@cell_name}.html"
        end if @cells
      end

      private

      def templates_path_prefix
        angular_templates_config[:ignore_prefix].try(:first) || 'templates/'
      end

      def angular_templates_config
        Rails.application.config.angular_templates || {}
      end

      def load_alchemy_yaml(name)
        YAML.load_file "#{Rails.root}/config/alchemy/#{name}"
      rescue Errno::ENOENT
        puts "\nERROR: Could not read config/alchemy/#{name} file. Please run: rails generate alchemy:scaffold"
      end
    end
  end
end
