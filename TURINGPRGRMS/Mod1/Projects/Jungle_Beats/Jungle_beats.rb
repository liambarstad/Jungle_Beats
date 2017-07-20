class Node
  attr_reader :data, :next_node
  def initialize(data)
    @data = data
    @next_node = []
  end
end


class LinkedList
  attr_reader :head, :list
  def initialize
    @list = []
    @head = @list.first
  end

  def append(data)
    @list.push(Node.new(data))
  end

  def prepend(data)
    @list.unshift(Node.new(data))
  end

  def insert(position, data)
    @list.insert(position, Node.new(data))
  end

  def pop(arg=0)
    @list.pop(arg + 1)
  end

  def find(start_position, elements)
    @list[start_position..(start_position + elements)].each do |node|
      node.data + "#{node != @list.last ? ' ' : ''}"
    end
  end

  def includes?(value)
    @list.find {|node| node.data == value}
  end

  def count
    @list.count
  end

  def to_string
    @list.each {|node| node.data + "#{node != @list.last ? ' ' : ''}"}
  end
end


class JungleBeat
  attr_reader :list, :rate, :voice
  def initialize(input=nil)
    @list = LinkedList.new
    if input != nil
      append(input)
    end
    @rate = 500
    @voice = "Boing"
  end

  def accepted_values
    ["Aah", "Ah", "Bong", "Boing", "Bing", "Bah", "Dong", "Ding", "Doo", "Dah", "Doing", "Eh", "Fah", "Gong", "Giggity", "Hah", "Hoo", "Lah", "Moo", "Ooh", "Oh", "Tah", "Woo", "Zippity", "Zoo", "Zah"]
  end

  def change_voice(voice)
    @voice = voice
  end

  def change_rate(rate)
    @rate = rate
  end

  def append(input)
    input.split.each do |word|
      if accepted_values.include?(word.capitalize)
        @list.append(word)
      end
    end
    string_together_nodes
  end


  def prepend(input)
    input.split.reverse.each do |word|
      if accepted_values.include?(word.capitalize)
        @list.prepend(word)
      end
    end
    string_together_nodes
  end

  def insert(position, input)
    if position <= @list.list.size + 1
      input.split.reverse.each do |word|
        @list.insert((position - 1), word)
      end
      string_together_nodes
    end
  end

  def count
    @list.count
  end

  def delete(num_or_int)
    if num_or_int.to_i == 0
      @list.list.delete_if {|node| node.data == num_or_int}
    elsif num_or_int.to_i > 0
      @list.list.slice!(num_or_int.to_i - 1)
      @list.list.each do |node|
        node.next_node.clear
      end
    end
    binding.pry
    string_together_nodes
  end

  def string_together_nodes
    for i in 0..(@list.list.size - 2)
      @list.list[i].next_node << @list.list[i + 1]
    end
  end

  def all
    operating_node = @list.list[0]
    strang = ""
    until operating_node == nil
      strang += operating_node.data + "#{operating_node.next_node != [] ? ' ' : ''}"
      operating_node = operating_node.next_node[0]
    end
    strang
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    `"say -r #{rate} -v #{voice} #{all}"`
  end
end
