  module ApplicationHelper
    include LocalTimeHelper

    def body_class
      body_class = @body_class || "default"
      body_class += " " + controller.controller_name.dasherize if controller.respond_to?(:controller_name)
      body_class += " " + controller.mailer_name.dasherize if controller.respond_to?(:mailer_name)
      body_class += " " + controller.action_name.dasherize if controller.respond_to?(:action_name)
      body_class
    end

    def page_title
      page = @title
      if page
        "#{page} | #{site_title}"
      else
        site_title
      end
    end

    def site_title
      "Prairie I/O"
    end

    def youtube_video(id)
      "<iframe src='http://www.youtube.com/embed/#{id}' frameborder='0' allowfullscreen></iframe>"
    end

  end
