import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { api } from '../api';

export default function ProductDetail() {
  const { id } = useParams();
  const [product, setProduct] = useState(null);
  const [vendors, setVendors] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [tab, setTab] = useState('vendors');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    Promise.all([
      api.getProduct(id),
      api.getProductVendors(id),
      api.getProductReviews(id),
    ])
      .then(([prod, vends, revs]) => {
        setProduct(prod);
        setVendors(vends);
        setReviews(revs);
      })
      .catch((err) => console.error(err))
      .finally(() => setLoading(false));
  }, [id]);

  if (loading) {
    return (
      <div className="animate-pulse space-y-6">
        <div className="h-8 bg-gray-200 rounded w-1/3" />
        <div className="h-4 bg-gray-200 rounded w-1/4" />
        <div className="grid grid-cols-2 gap-6">
          <div className="h-64 bg-gray-200 rounded-xl" />
          <div className="space-y-4">
            <div className="h-4 bg-gray-200 rounded" />
            <div className="h-4 bg-gray-200 rounded w-3/4" />
            <div className="h-4 bg-gray-200 rounded w-1/2" />
          </div>
        </div>
      </div>
    );
  }

  if (!product) {
    return (
      <div className="text-center py-16">
        <h2 className="text-xl font-medium text-gray-900">Product not found</h2>
        <Link to="/" className="text-indigo-600 hover:underline mt-2 inline-block">
          Back to products
        </Link>
      </div>
    );
  }

  const specs = product.specifications || {};
  const avgRating =
    reviews.length > 0
      ? (reviews.reduce((sum, r) => sum + (r.rating || 0), 0) / reviews.length).toFixed(1)
      : null;

  return (
    <div>
      {/* Breadcrumb */}
      <nav className="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <Link to="/" className="hover:text-indigo-600">
          Products
        </Link>
        <span>/</span>
        <span className="text-gray-900">{product.name}</span>
      </nav>

      {/* Product Header */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-10">
        {/* Left: Image placeholder */}
        <div className="bg-gradient-to-br from-indigo-50 to-purple-50 rounded-2xl flex items-center justify-center h-80">
          <span className="text-8xl opacity-50">
            {product.category === 'electronics'
              ? '💻'
              : product.category === 'accessories'
              ? '🎧'
              : '🏠'}
          </span>
        </div>

        {/* Right: Info */}
        <div>
          <div className="flex items-center gap-3 mb-2">
            <span className="text-xs font-medium px-2.5 py-1 rounded-full bg-indigo-100 text-indigo-700">
              {product.category}
            </span>
            {avgRating && (
              <span className="flex items-center gap-1 text-sm text-amber-600 font-medium">
                <svg className="w-4 h-4 fill-amber-400" viewBox="0 0 20 20">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                </svg>
                {avgRating} ({reviews.length} reviews)
              </span>
            )}
          </div>

          <h1 className="text-3xl font-bold text-gray-900 mb-1">{product.name}</h1>
          <p className="text-lg text-gray-500 mb-4">{product.brand}</p>
          <p className="text-gray-700 leading-relaxed mb-6">{product.description}</p>

          {/* Price range */}
          {vendors.length > 0 && (
            <div className="bg-green-50 border border-green-200 rounded-xl p-4 mb-6">
              <p className="text-sm text-green-600 font-medium">Price range across vendors</p>
              <p className="text-2xl font-bold text-green-700">
                ${Math.min(...vendors.map((v) => v.price)).toFixed(2)} — $
                {Math.max(...vendors.map((v) => v.price)).toFixed(2)}
              </p>
              <p className="text-sm text-green-600 mt-1">
                Available from {vendors.length} vendor{vendors.length > 1 ? 's' : ''}
              </p>
            </div>
          )}

          {/* Specs */}
          {Object.keys(specs).length > 0 && (
            <div>
              <h3 className="font-semibold text-gray-900 mb-3">Specifications</h3>
              <dl className="grid grid-cols-2 gap-x-4 gap-y-2">
                {Object.entries(specs).map(([key, val]) => (
                  <div key={key} className="flex flex-col">
                    <dt className="text-xs text-gray-500 uppercase tracking-wide">{key}</dt>
                    <dd className="text-sm font-medium text-gray-900">{val}</dd>
                  </div>
                ))}
              </dl>
            </div>
          )}
        </div>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200 mb-6">
        <div className="flex gap-4">
          {[
            { key: 'vendors', label: `Vendor Comparison (${vendors.length})` },
            { key: 'reviews', label: `Reviews (${reviews.length})` },
          ].map((t) => (
            <button
              key={t.key}
              onClick={() => setTab(t.key)}
              className={`pb-3 px-1 text-sm font-medium border-b-2 transition-colors cursor-pointer ${
                tab === t.key
                  ? 'border-indigo-600 text-indigo-600'
                  : 'border-transparent text-gray-500 hover:text-gray-700'
              }`}
            >
              {t.label}
            </button>
          ))}
        </div>
      </div>

      {/* Tab Content */}
      {tab === 'vendors' && <VendorComparison vendors={vendors} />}
      {tab === 'reviews' && <ReviewList reviews={reviews} />}
    </div>
  );
}

function VendorComparison({ vendors }) {
  if (vendors.length === 0) {
    return <p className="text-gray-500 py-8 text-center">No vendors available for this product.</p>;
  }

  return (
    <div className="overflow-x-auto">
      <table className="w-full">
        <thead>
          <tr className="text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            <th className="pb-3 pr-4">Vendor</th>
            <th className="pb-3 pr-4">Price</th>
            <th className="pb-3 pr-4">Rating</th>
            <th className="pb-3 pr-4">Stock</th>
            <th className="pb-3 pr-4">Delivery</th>
            <th className="pb-3">Coupon</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100">
          {vendors.map((v, i) => (
            <tr key={v.id} className={i === 0 ? 'bg-green-50' : ''}>
              <td className="py-4 pr-4">
                <div className="flex items-center gap-2">
                  <span className="font-medium text-gray-900">{v.vendor_name}</span>
                  {i === 0 && (
                    <span className="text-xs bg-green-100 text-green-700 px-2 py-0.5 rounded-full font-medium">
                      Best Price
                    </span>
                  )}
                </div>
              </td>
              <td className="py-4 pr-4">
                <span className={`font-semibold ${i === 0 ? 'text-green-700' : 'text-gray-900'}`}>
                  ${v.price.toFixed(2)}
                </span>
              </td>
              <td className="py-4 pr-4">
                {v.vendor_rating ? (
                  <div className="flex items-center gap-1">
                    <svg className="w-4 h-4 fill-amber-400" viewBox="0 0 20 20">
                      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                    <span className="text-sm">{v.vendor_rating.toFixed(1)}</span>
                  </div>
                ) : (
                  <span className="text-sm text-gray-400">N/A</span>
                )}
              </td>
              <td className="py-4 pr-4">
                <span
                  className={`text-sm ${
                    v.stock_quantity > 10
                      ? 'text-green-600'
                      : v.stock_quantity > 0
                      ? 'text-amber-600'
                      : 'text-red-600'
                  }`}
                >
                  {v.stock_quantity > 0 ? `${v.stock_quantity} in stock` : 'Out of stock'}
                </span>
              </td>
              <td className="py-4 pr-4 text-sm text-gray-600">
                {v.delivery_days} day{v.delivery_days !== 1 ? 's' : ''}
              </td>
              <td className="py-4">
                {v.coupon_code ? (
                  <span className="inline-flex items-center px-2.5 py-1 rounded-md bg-amber-50 border border-amber-200 text-amber-700 text-xs font-mono font-medium">
                    {v.coupon_code}
                  </span>
                ) : (
                  <span className="text-sm text-gray-400">—</span>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function ReviewList({ reviews }) {
  if (reviews.length === 0) {
    return <p className="text-gray-500 py-8 text-center">No reviews yet for this product.</p>;
  }

  return (
    <div className="space-y-4">
      {reviews.map((r) => (
        <div key={r.id} className="bg-white border border-gray-200 rounded-xl p-5">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-3">
              <div className="flex gap-0.5">
                {[1, 2, 3, 4, 5].map((star) => (
                  <svg
                    key={star}
                    className={`w-4 h-4 ${
                      star <= (r.rating || 0) ? 'fill-amber-400' : 'fill-gray-200'
                    }`}
                    viewBox="0 0 20 20"
                  >
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                ))}
              </div>
              <span className="text-sm font-medium text-gray-900">{r.rating?.toFixed(1)}/5</span>
            </div>
            <span className="text-xs text-gray-400 bg-gray-50 px-2 py-1 rounded-full">
              via {r.vendor_name}
            </span>
          </div>
          <p className="text-gray-700 text-sm leading-relaxed">{r.review_text}</p>
          {r.created_at && (
            <p className="text-xs text-gray-400 mt-3">
              {new Date(r.created_at).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
              })}
            </p>
          )}
        </div>
      ))}
    </div>
  );
}
