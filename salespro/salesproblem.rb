class Item
    attr_reader :name, :price, :imported, :exempt
  
    def initialize(name, price)
      @name = name
      @price = price.to_f
      @imported = name.include?("imported")
      @exempt = exempt_item?(name)
    end
  
    def exempt_item?(name)
      exempt_items = ["book", "chocolate", "pills"]
      exempt_items.any? { |item| name.include?(item) }
    end

    def basic_sales_tax
        exempt ? 0.0 : (price * 0.10).round(2)
    end

    def import_duty
        imported ? (price * 0.05).round(2) : 0.0
    end
    
    def total_tax
        (basic_sales_tax + import_duty).ceil_to_nearest(0.05)
    end
    
    def total_price
        price + total_tax
    end
end


class Float
    def ceil_to_nearest(nearest)
      (self / nearest).ceil * nearest
    end
end


class Receipt
    def initialize(items)
      @items = items
      @total_taxes = 0.0
      @total_price = 0.0
    end
  
    def print_receipt
      @items.each do |item|
        @total_taxes += item.total_tax
        @total_price += item.total_price
        puts "#{item.name}: #{'%.2f' % item.total_price}"
      end
      puts "Sales Taxes: #{'%.2f' % @total_taxes}"
      puts "Total: #{'%.2f' % @total_price}"
    end
end
  
def process_input(input)
    items = []
    input.each_line do |line|
      quantity, name, price = line.match(/(\d+) (.+) at (\d+\.\d{2})/).captures
      quantity.to_i.times { items << Item.new(name, price) }
    end
    return items
end

  input1 = <<~INPUT
  1 book at 12.49
  1 music CD at 14.99
  1 chocolate bar at 0.85
INPUT

input2 = <<~INPUT
    1 imported box of chocolates at 10.00
    1 imported bottle of perfume at 47.50
INPUT
input3 = <<~INPUT
  1 imported bottle of perfume at 27.99
  1 bottle of perfume at 18.99
  1 packet of headache pills at 9.75
  1 box of imported chocolates at 11.25
INPUT


[ input1, input2, input3 ].each_with_index do |input, index|
    puts "Output #{index + 1}:"
    items = process_input(input)
    receipt = Receipt.new(items)
    receipt.print_receipt
    puts
end