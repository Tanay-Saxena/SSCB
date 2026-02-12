import { useState, useEffect } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { api } from '../api';

const CATEGORIES = ['All', 'Electronics', 'Gaming', 'Accessories', 'Home', 'Lifestyle', 'Festive'];

export default function ProductList() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [activeCategory, setActiveCategory] = useState('All');
  const [searchParams] = useSearchParams();
  const searchQuery = searchParams.get('search') || '';

  useEffect(() => {
    setLoading(true);
    const fetchProducts = async () => {
      try {
        let data;
        if (searchQuery) {
          data = await api.searchProducts(searchQuery);
          setActiveCategory('All');
        } else if (activeCategory === 'All') {
          data = await api.getProducts();
        } else {
          data = await api.getProducts(activeCategory.toLowerCase());
        }
        setProducts(data);
      } catch (err) {
        console.error('Failed to fetch products:', err);
      } finally {
        setLoading(false);
      }
    };
    fetchProducts();
  }, [activeCategory, searchQuery]);

  const categoryColors = {
    electronics: 'bg-blue-100 text-blue-700',
    accessories: 'bg-purple-100 text-purple-700',
    home: 'bg-green-100 text-green-700',
    gaming: 'bg-red-100 text-red-700',
    lifestyle: 'bg-pink-100 text-pink-700',
    festive: 'bg-amber-100 text-amber-700',
  };

  return (
    <div>
      {/* Page Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">
          {searchQuery ? `Results for "${searchQuery}"` : 'Products'}
        </h1>
        <p className="mt-1 text-gray-500">
          {searchQuery
            ? `${products.length} product${products.length !== 1 ? 's' : ''} found`
            : 'Browse our multi-vendor marketplace'}
        </p>
      </div>

      {/* Category Filters */}
      {!searchQuery && (
        <div className="flex gap-2 mb-6">
          {CATEGORIES.map((cat) => (
            <button
              key={cat}
              onClick={() => setActiveCategory(cat)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all cursor-pointer ${
                activeCategory === cat
                  ? 'bg-indigo-600 text-white shadow-sm'
                  : 'bg-white text-gray-600 border border-gray-200 hover:border-indigo-300 hover:text-indigo-600'
              }`}
            >
              {cat}
            </button>
          ))}
        </div>
      )}

      {/* Product Grid */}
      {loading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {[...Array(8)].map((_, i) => (
            <div key={i} className="bg-white rounded-xl border border-gray-200 p-6 animate-pulse">
              <div className="h-40 bg-gray-200 rounded-lg mb-4" />
              <div className="h-5 bg-gray-200 rounded w-3/4 mb-2" />
              <div className="h-4 bg-gray-200 rounded w-1/2" />
            </div>
          ))}
        </div>
      ) : products.length === 0 ? (
        <div className="text-center py-16">
          <div className="text-6xl mb-4">:(</div>
          <h3 className="text-lg font-medium text-gray-900">No products found</h3>
          <p className="text-gray-500 mt-1">Try a different search or category</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {products.map((product) => (
            <Link
              key={product.id}
              to={`/products/${product.id}`}
              className="group bg-white rounded-xl border border-gray-200 hover:border-indigo-300 hover:shadow-lg transition-all duration-200 overflow-hidden"
            >
              {/* Product image placeholder */}
              <div className="h-44 bg-gradient-to-br from-indigo-50 to-purple-50 flex items-center justify-center group-hover:from-indigo-100 group-hover:to-purple-100 transition-colors">
                <span className="text-5xl opacity-60">
                  {product.category === 'electronics'
                    ? '💻'
                    : product.category === 'accessories'
                    ? '🎧'
                    : product.category === 'gaming'
                    ? '🎮'
                    : product.category === 'lifestyle'
                    ? '✨'
                    : product.category === 'festive'
                    ? '🎉'
                    : '🏠'}
                </span>
              </div>

              <div className="p-5">
                <div className="flex items-center gap-2 mb-2">
                  <span
                    className={`text-xs font-medium px-2 py-0.5 rounded-full ${
                      categoryColors[product.category] || 'bg-gray-100 text-gray-600'
                    }`}
                  >
                    {product.category}
                  </span>
                </div>
                <h3 className="font-semibold text-gray-900 group-hover:text-indigo-600 transition-colors line-clamp-1">
                  {product.name}
                </h3>
                <p className="text-sm text-gray-500 mt-0.5">{product.brand}</p>
                <p className="text-sm text-gray-600 mt-2 line-clamp-2">{product.description}</p>
              </div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
