module TaggedBuilderHelper

  def text_field(label, *args)
    debug label
#    @template.content_tag(:p,
#      @template.content_tag(:label,
#                            label.to_s.humanize,
#                            :for => "#{@object_name}_#{label}") + "<br />" + super)
  end

end
