# encoding: utf-8
LineItem.delete_all
Product.delete_all
# . . .
Product.create(title: 'Programming Ruby 1.9',
description:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>},
image_url: 'ruby.jpg',
price: 49.95,
locale: 'en')
Product.create(title: 'second Ruby 1.9',
description:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>},
image_url: 'ruby.jpg',
price: 49.95,
locale: 'en')
Product.create(title: 'third Ruby 1.9',
description:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>},
image_url: 'ruby.jpg',
price: 49.95,
locale: 'en')
Product.create(title: 'Русский продукт',
description:
%{<p>
Русский продукт.
</p>},
image_url: 'ruby.jpg',
price: 1.95,
locale: 'ru')
PayType.delete_all
PayType.create(:name => "Check", :locale => 'en')
PayType.create(:name => "Credit card", :locale => 'en')
PayType.create(:name => "Purchase order", :locale => 'en')
PayType.create(:name => "Чек", :locale => 'ru')
PayType.create(:name => "Кредитка", :locale => 'ru')
PayType.create(:name => "Счет",:locale => 'ru')