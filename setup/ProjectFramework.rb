require 'xcodeproj'

module Pod

  class ProjectFramework
    attr_reader :configurator, :xcodeproj_path, :platform, :string_replacements, :string_replacements1, :prefix

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @xcodeproj_path = options.fetch(:xcodeproj_path)
      @configurator = options.fetch(:configurator)
      @platform = options.fetch(:platform)
      @prefix = options.fetch(:prefix)
    end

    def run
      @string_replacements = {
        "PROJECT_OWNER" => @configurator.user_name,
        "TODAYS_DATE" => @configurator.date,
        "TODAYS_YEAR" => @configurator.year,
        "PROJECT" => @configurator.pod_name
      }
      @string_replacements1 = {
          "CPD" => @prefix
      }
      replace_internal_project_settings

      @project = Xcodeproj::Project.open(@xcodeproj_path)
      add_podspec_metadata
      @project.save

      rename_files
      rename_project_folder
    end

    def project_folder
      File.dirname @xcodeproj_path
    end
    
    def add_podspec_metadata
        project_metadata_item = @project.root_object.main_group.children.select { |group| group.name == "Podspec Metadata" }.first
        project_metadata_item.new_file "./" + @configurator.pod_name  + ".podspec"
        project_metadata_item.new_file "./README.md"
        project_metadata_item.new_file "./LICENSE"
    end

    def rename_files
      # shared schemes have project specific names
      scheme_path = project_folder + "/PROJECT.xcodeproj/xcshareddata/xcschemes/"
      File.rename(scheme_path + "PROJECT.xcscheme", scheme_path +  @configurator.pod_name + ".xcscheme")

      # rename xcproject
      File.rename(project_folder + "/PROJECT.xcodeproj", project_folder + "/" +  @configurator.pod_name + ".xcodeproj")
      
      # rename modulemap
      File.rename(project_folder + "/PROJECT.modulemap", project_folder + "/" +  @configurator.pod_name + ".modulemap")

        # change app file prefixes
        ["PROJECTActivator.h", "PROJECTActivator.m"].each do |file|
            before = project_folder + "/PROJECT/Classes/" + file
            next unless File.exists? before
            
            after = project_folder + "/PROJECT/Classes/" + file.gsub("PROJECT", @configurator.pod_name)
            File.rename before, after
        end
        
        ["PROJECTBundle.h", "PROJECTBundle.m", "UIView+PROJECTNib.h", "UIView+PROJECTNib.m", "PROJECTImage.h", "PROJECTImage.m"].each do |file|
            before = project_folder + "/PROJECT/Classes/Utils/" + file
            next unless File.exists? before
            
            after = project_folder + "/PROJECT/Classes/Utils/" + file.gsub("PROJECT", @configurator.pod_name)
            File.rename before, after
        end

        ["CPDNextViewController.h", "CPDNextViewController.m", "CPDViewController.h", "CPDViewController.m"].each do |file|
            before = project_folder + "/PROJECT/Classes/UI/" + file
            next unless File.exists? before
            
            after = project_folder + "/PROJECT/Classes/UI/" + file.gsub("CPD", @prefix)
            File.rename before, after
        end
        
        # rename project related files
        ["PROJECT.h", "PROJECT.modulemap"].each do |file|
            before = project_folder + "/PROJECT/" + file
            next unless File.exists? before
            
            after = project_folder + "/PROJECT/" + file.gsub("PROJECT", @configurator.pod_name)
            File.rename before, after
        end
        
        # rename project tests related files
        ["PROJECTTests.m"].each do |file|
            before = project_folder + "/PROJECTTests/" + file
            next unless File.exists? before
            
            after = project_folder + "/PROJECTTests/" + file.gsub("PROJECT", @configurator.pod_name)
            File.rename before, after
        end

    end

    def rename_project_folder
      if Dir.exist? project_folder + "/PROJECT"
        File.rename(project_folder + "/PROJECT", project_folder + "/" + @configurator.pod_name)
      end
      
      if Dir.exist? project_folder + "/PROJECTTests"
          File.rename(project_folder + "/PROJECTTests", project_folder + "/" + @configurator.pod_name + "Tests")
      end
      
      if Dir.exist? project_folder + "/PROJECTResources"
          File.rename(project_folder + "/PROJECTResources", project_folder + "/" + @configurator.pod_name + "Resources")
      end
      
    end

    def replace_internal_project_settings
      Dir.glob(project_folder + "/**/**/**/**").each do |name|
        next if Dir.exists? name
        text = File.read(name)

        for find, replace in @string_replacements
            text = text.gsub(find, replace)
        end
        for find, replace in @string_replacements1
            text = text.gsub(find, replace)
        end

        File.open(name, "w") { |file| file.puts text }
      end
    end

  end

end
