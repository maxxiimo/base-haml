module ApplicationHelper
  def head
    render :partial => 'layouts/head'
  end

  def scripts
    render :partial => 'layouts/scripts'
  end

  def chromeframe
    render :partial => 'layouts/chromeframe'
  end
end
