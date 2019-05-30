module PostsHelper
    def bg_badge(category)
    case category
        when 'Programación' then "badge-primary"
        when 'Javascript' then "badge-secondary"
        when 'Ruby' then "badge-danger"
        when 'Ruby on rails' then "badge-warning"
        when 'React' then "badge-info"
        when 'React native' then "badge-success"
        when 'NodeJS' then "badge-success"
        end
  end
end
