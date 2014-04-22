module ApplicationHelper

  def typekit_include_tag apikey
  javascript_include_tag("//use.typekit.com/euf0zmd.js") +
  javascript_tag("try{Typekit.load()}catch(e){}")
end

end
