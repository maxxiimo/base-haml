!!!
%html.no-js{lang: 'en'}
  = head
  %body
    .wrapper
      = browsehappy
      %header{role: 'banner', :id => 'top'}
        = render 'layouts/utility'
        .container
          = render 'layouts/logo'
          = yield :main_navigation
          = yield :sub_navigation
          - flash.each do |k,v|
            %div{class: 'flash #{k}'}= v
      #main{role: 'main'}
        .container
          = yield
      = render 'layouts/footer'
    = scripts


- - - - - - - - - - - - - - - - - - - - - - - - - -


- content_for :title do
  Assets Dashboard
= main_navigation 'Assets'
= sub_navigation 'Dashboard'


- - - - - - - - - - - - - - - - - - - - - - - - - -


  def nav_location(title, url, options = {})
    # option defined through "current: current_nav", local variable from main_navigation method
    # strips :current?
    current_nav = options.delete(:current)
    options[:class] = (current_nav == title) ? 'active' : 'inactive'
    content_tag(:li, link_to(title, url), options)
  end

  def main_navigation(location)
    # local variable current_nav set by "= main_navigation '<Something>'" in view
    render partial: 'layouts/navigation', locals: {current_nav: location}
  end

  # Couldn't I pass in two local variables?
  #
  # def currently_at(location, sub_nav)
  #   render partial: 'layouts/navigation', locals: {current_nav: location, sub_navigation: sub_nav}
  # end

  # How can I pass in the previous methods "location"?
  def sub_navigation(location)
    if location = 'Assets'
      render partial: 'layouts/nav_assets', locals: {current_nav: location}
    elsif location = 'Projects'
      render partial: 'layouts/nav_projects', locals: {current_nav: location}
    else
      render partial: 'layouts/nav_dashboard', locals: {current_nav: location}
    end
  end

  # Another idea that didn't go anywhere...
  #
  # def sub_navigation(sub_nav)
  #   if sub_nav = 'Assets'
  #     render partial: 'layouts/nav_assets'
  #   elsif sub_nav = 'Projects'
  #     render partial: 'layouts/nav_projects'
  #   else
  #     render partial: 'layouts/nav_dashboard'
  #   end
  # end
end


- - - - - - - - - - - - - - - - - - - - - - - - - -


- content_for :main_navigation do
  =# render 'layouts/nav_main'
  %span.menu_trigger{"data-dropdown" => "#main_nav-1", :class => 'sprite house'} Menu
  #main_nav-1.dropdown
    %ul.dropdown-menu
      = nav_location 'Dashboard', pages_dashboard_back_end_nav_path, current: current_nav
      = nav_location 'Projects', pages_my_projects_path, current: current_nav
      = nav_location 'Assets', pages_assets_back_end_path, current: current_nav
      = nav_location 'Users', pages_users_detail_path, current: current_nav
      = nav_location 'My Account', root_path, current: current_nav
  .clearfix

/   - if sub_navigation = 'Assets'
/     = render 'layouts/nav_assets'
/     ASSETS

/   - elsif sub_navigation = 'Projects'
/     = render 'layouts/nav_projects'
/     PROJECTS

/   - else sub_navigation = 'Dashboard'
/     = render 'layouts/nav_dashboard'
/     DASHBOARD

/ - content_for :sub_navigation do
/     = render 'layouts/nav_assets'
/     ASSETS

/   - elsif sub_navigation = 'Projects'
/     = render 'layouts/nav_projects'
/     PROJECTS

/   - else sub_navigation = 'Dashboard'
/     = render 'layouts/nav_dashboard'
/     DASHBOARD


- - - - - - - - - - - - - - - - - - - - - - - - - -

// The Assets sub menu should be shown on any of the following pages
// - pages/assets_back_end
// - pages/alerts_back_end
// - pages/assets_back_end_detail

- content_for :sub_navigation do
  %nav{role: "navigation", :id => 'nav_assets', :class => 'sub_menu'}
    %ul
      = nav_location 'Dashboard', pages_assets_back_end_path, current: current_nav
      = nav_location 'Items', pages_assets_back_end_detail_path, current: current_nav
      = nav_location 'Review & Ratings', pages_alerts_back_end_path, current: current_nav
      = nav_location 'Alerts & Activities', root_path, current: current_nav
      = nav_location 'Item Tree', root_path, current: current_nav
      ASSETS
      / %li
      /   %a{:href => '/pages/assets_back_end'} Dashboard
      / %li
      /   %a{:href => '/pages/assets_back_end'} Items
      / %li
      /   %a{:href => '/pages/alerts_back_end'} Review &amp; Ratings
      / %li
      /   %a{:href => '/pages/alerts_back_end'} Alerts &amp; Activities
      / %li
      /   %a{:href => '/pages/activity'} Item Tree


- - - - - - - - - - - - - - - - - - - - - - - - - -


// The Projects sub menu should be shown on any of the following pages
// - pages/my_projects
// - pages/new_project
// - pages/reports
// - pages/image_library

- content_for :sub_navigation do
  %nav{role: "navigation", :id => 'nav_projects', :class => 'sub_menu'}
    %ul
      = nav_location 'My Projects', pages_my_projects_path, current: current_nav
      = nav_location 'New Project', pages_new_project_path, current: current_nav
      = nav_location 'Reports', pages_reports_path, current: current_nav
      = nav_location 'Image Library', root_path, current: current_nav
      PROJECTS
      / %li
      /   %a{:href => '/pages/my_projects'} My Projects
      / %li
      /   %a{:href => '/pages/new_project'} New Project
      / %li
      /   %a{:href => '/pages/reports'} Reports
      / %li
      /   %a{:href => '/pages/image_library'} Image Library


- - - - - - - - - - - - - - - - - - - - - - - - - -



