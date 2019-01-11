# TODO: complete this class

class PaginationHelper

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end
  
  # returns the number of items within the entire collection
  def item_count
    @collection.count.to_f
  end
	
  # returns the number of pages
  def page_count
    (item_count / @items_per_page.to_f).ceil
  end
	
  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    (page_index > (sliced_array.count - 1) || page_index < -1) ? -1 : sliced_array[page_index].count
  end
	
  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index) 
    item_index < 0 || item_index > (@collection.count - 1) ? -1 : (item_index.abs / @items_per_page)
  end

  def sliced_array
    @collection.each_slice(@items_per_page).to_a
  end

end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
puts helper.page_index(4)