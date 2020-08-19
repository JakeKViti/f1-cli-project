class Project::CLI
    def start
        puts "Welcome to F1 API!"
        Project::API.get_seasons
    end

    def menu
        puts "Please select a category"
        list_categories
    end

    def list_categories
        
    end
end