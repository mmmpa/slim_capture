module ApplicationHelper
def write_tree(tree)
  return unless tree

  children = (tree[:children] || []).map { |child|
    write_tree(child)
  }.join.html_safe

  "<li>#{tree[:title]}<ol>#{children}</ol></li>".html_safe
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
  capture(tree[:title], tree[:children], pass, &pass)
end
end
