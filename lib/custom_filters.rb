module CustomFilters
  def CustomFilters.format_price(amount)
    Spree::Money.new(amount)
  end

  def CustomFilters.price_filter
    v = Spree::Price.arel_table
    conds = [ [ Spree.t(:under_price, price: format_price(10))     , v[:amount].lteq(10)],
              [ "#{format_price(10)} - #{format_price(45)}"        , v[:amount].in(10..45)],
              [ "#{format_price(45)} - #{format_price(100)}"        , v[:amount].in(45..100)],
              [ "#{format_price(100)} - #{format_price(250)}"        , v[:amount].in(100..250)],
              [ Spree.t(:or_over_price, price: format_price(250)) , v[:amount].gteq(250)]]
    {
      name:   Spree.t(:price_range),
      scope:  :price_range_any,
      conds:  Hash[*conds.flatten],
      labels: conds.map { |k,v| [k, k] }
    }
  end
end
