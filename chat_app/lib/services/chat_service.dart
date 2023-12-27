class ChatService{ 

 Future <Map<String, dynamic>> fetchChatResponse(String text) async  {

   await Future.delayed(const Duration(milliseconds: 1000));
    //response should have a message describing some of the products also making some suggestions
    // 4 product photo links plus some information about the product
        Map<String, dynamic> response = {

      'products': products,
      'recommendation': 'Based on your query, I recommend product4. It is best suited for Category 3 and priced at \$12.99. It has also been a bestseller in its catgory for over 4 months.',
    };
    return response;
  }
}

Map<String, dynamic> products = {
  'product1': {
    'image': 'https://m.media-amazon.com/images/I/41EWnXeuMzL._AC_SR400,600_AGcontrast_.jpg',
    'description': 'Product 1 description',
    'price': 10.99,
    'best_for': 'Category 1',
  },
  'product2': {
    'image': 'https://m.media-amazon.com/images/I/41O-kuT4riL._AC_SR400,600_AGcontrast_.jpg',
    'description': 'Product 2 description',
    'price': 19.99,
    'best_for': 'Category 2',
  },
  'product3': {
    'image': 'https://m.media-amazon.com/images/I/41LHHE-OneL._AC_SR400,600_AGcontrast_.jpg',
    'description': 'Product 3 description',
    'price': 15.99,
    'best_for': 'Category 1',
  },
  'product4': {
    'image': 'https://m.media-amazon.com/images/I/41sZtjTYn3L._AC_SR400,600_AGcontrast_.jpg',
    'description': 'Product 4 description',
    'price': 12.99,
    'best_for': 'Category 3',
  },
  'product5': {
    'image': 'https://m.media-amazon.com/images/I/310ErDAendL._AC_SR400,600_AGcontrast_.jpg',
    'description': 'Product 5 description',
    'price': 9.99,
    'best_for': 'Category 2',
  },
};

