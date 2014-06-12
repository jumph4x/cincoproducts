module CustomFilters
  def CustomFilters.format_price(amount)
    Spree::Money.new(amount)
  end

  def CustomFilters.price_filter
    v = Spree::Price.arel_table
    conds = [ [ Spree.t(:under_price, price: "$10")     , v[:amount].lteq(10)],
              [ "$10 - $45"        , v[:amount].in(10..45)],
              [ "$45 - $100"        , v[:amount].in(45..100)],
              [ "$100 - $250"        , v[:amount].in(100..250)],
              [ Spree.t(:or_over_price, price: "$250") , v[:amount].gteq(250)]]
    {
      name:   Spree.t(:price_range),
      scope:  :price_range_any,
      conds:  Hash[*conds.flatten],
      labels: conds.map { |k,v| [k, k] }
    }
  end
end
