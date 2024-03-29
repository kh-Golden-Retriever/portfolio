class CommentDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
    def created_at
      # helpers.content_tag :span, class: 'time' do
        object.created_at.strftime("%Y/%-m/%-d %H:%M")
      # end
    end

end
