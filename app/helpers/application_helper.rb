module ApplicationHelper
  def cut_off(text, len)
    if text != nil
      if text.length < len
        text
      else
        text.scan(/^.{#{len}}/m)[0] + "……"
      end
    else
      ''
    end
  end
end
