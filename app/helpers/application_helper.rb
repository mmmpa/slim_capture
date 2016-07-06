module ApplicationHelper
  def write_tree(tree)
    return unless tree

    tree.map { |content|
      "<ul><li>#{content[:title]}#{write_tree(content[:children])}</li></ul>"
    }.join.html_safe
  end

  def write_block_tree(tree, &block)
    return unless tree

    tree.each do |child|
      block.call(child, &block)
    end
  end

  def write_capture_tree(tree, proc = nil, &block)
    return unless tree

    pass = block ? block : proc
    tree.map { |child|
      capture(child, pass, &pass)
    }.join.html_safe
  end
end
