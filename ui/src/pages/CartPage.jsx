import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../api';

export default function CartPage() {
  const [cart, setCart] = useState(null);
  const [loading, setLoading] = useState(true);
  const [budgetResult, setBudgetResult] = useState(null);
  const [optimizeResult, setOptimizeResult] = useState(null);
  const [budgetLoading, setBudgetLoading] = useState(false);
  const [optimizeLoading, setOptimizeLoading] = useState(false);

  useEffect(() => {
    api
      .getCart(1)
      .then(setCart)
      .catch((err) => console.error(err))
      .finally(() => setLoading(false));
  }, []);

  const checkBudget = async () => {
    setBudgetLoading(true);
    try {
      const result = await api.budgetCheck(1);
      setBudgetResult(result);
    } catch {
      setBudgetResult({ answer: 'Failed to check budget. Please try again.' });
    } finally {
      setBudgetLoading(false);
    }
  };

  const optimizeCart = async () => {
    setOptimizeLoading(true);
    try {
      const result = await api.cartOptimization(1);
      setOptimizeResult(result);
    } catch {
      setOptimizeResult({ answer: 'Failed to optimize cart. Please try again.' });
    } finally {
      setOptimizeLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="animate-pulse space-y-4">
        <div className="h-8 bg-gray-200 rounded w-1/4" />
        {[...Array(3)].map((_, i) => (
          <div key={i} className="h-24 bg-gray-200 rounded-xl" />
        ))}
      </div>
    );
  }

  if (!cart) {
    return (
      <div className="text-center py-16">
        <h2 className="text-xl font-medium text-gray-900">Cart not found</h2>
      </div>
    );
  }

  const items = cart.items || [];
  const withinBudget = cart.budget_limit ? cart.cart_total <= cart.budget_limit : null;

  return (
    <div>
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Shopping Cart</h1>
          <p className="text-gray-500 mt-1">
            {cart.user_id}'s cart — {items.length} item{items.length !== 1 ? 's' : ''}
          </p>
        </div>
        <div className="flex gap-3">
          <button
            onClick={checkBudget}
            disabled={budgetLoading}
            className="px-4 py-2 bg-white border border-gray-300 rounded-lg text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50 transition-colors cursor-pointer"
          >
            {budgetLoading ? 'Checking...' : 'Budget Check'}
          </button>
          <button
            onClick={optimizeCart}
            disabled={optimizeLoading}
            className="px-4 py-2 bg-indigo-600 text-white rounded-lg text-sm font-medium hover:bg-indigo-700 disabled:opacity-50 transition-colors cursor-pointer"
          >
            {optimizeLoading ? 'Analyzing...' : 'AI Optimize'}
          </button>
        </div>
      </div>

      {/* Budget Bar */}
      {cart.budget_limit && (
        <div className="mb-6 bg-white rounded-xl border border-gray-200 p-5">
          <div className="flex items-center justify-between mb-2">
            <span className="text-sm font-medium text-gray-700">Budget Usage</span>
            <span className="text-sm font-medium text-gray-900">
              ${cart.cart_total.toFixed(2)} / ${cart.budget_limit.toFixed(2)}
            </span>
          </div>
          <div className="w-full bg-gray-100 rounded-full h-3 overflow-hidden">
            <div
              className={`h-full rounded-full transition-all duration-500 ${
                withinBudget ? 'bg-green-500' : 'bg-red-500'
              }`}
              style={{
                width: `${Math.min(100, (cart.cart_total / cart.budget_limit) * 100)}%`,
              }}
            />
          </div>
          <p className={`text-xs mt-1 ${withinBudget ? 'text-green-600' : 'text-red-600'}`}>
            {withinBudget
              ? `$${(cart.budget_limit - cart.cart_total).toFixed(2)} remaining`
              : `$${(cart.cart_total - cart.budget_limit).toFixed(2)} over budget`}
          </p>
        </div>
      )}

      {/* Cart Items */}
      <div className="space-y-3 mb-8">
        {items.map((item) => (
          <div
            key={item.id}
            className="bg-white rounded-xl border border-gray-200 p-5 flex items-center gap-5"
          >
            {/* Product icon */}
            <div className="w-16 h-16 bg-gradient-to-br from-indigo-50 to-purple-50 rounded-lg flex items-center justify-center shrink-0">
              <span className="text-2xl opacity-60">
                {item.product_name?.includes('Book') || item.product_name?.includes('Tab')
                  ? '💻'
                  : item.product_name?.includes('Phone')
                  ? '📱'
                  : '📦'}
              </span>
            </div>

            {/* Details */}
            <div className="flex-1 min-w-0">
              <Link
                to={`/products/${item.product_id || '#'}`}
                className="font-medium text-gray-900 hover:text-indigo-600 transition-colors"
              >
                {item.product_name}
              </Link>
              <p className="text-sm text-gray-500">from {item.vendor_name}</p>
            </div>

            {/* Price x Qty */}
            <div className="text-right shrink-0">
              <p className="font-semibold text-gray-900">${item.line_total.toFixed(2)}</p>
              <p className="text-sm text-gray-500">
                ${item.price.toFixed(2)} x {item.quantity}
              </p>
            </div>
          </div>
        ))}
      </div>

      {/* Cart Total */}
      <div className="bg-white rounded-xl border border-gray-200 p-5 flex items-center justify-between">
        <span className="text-lg font-semibold text-gray-900">Cart Total</span>
        <span className="text-2xl font-bold text-gray-900">${cart.cart_total.toFixed(2)}</span>
      </div>

      {/* Budget Check Result */}
      {budgetResult && (
        <div className="mt-6 bg-blue-50 border border-blue-200 rounded-xl p-5">
          <h3 className="font-semibold text-blue-900 mb-2">Budget Check Result</h3>
          <pre className="text-sm text-blue-800 whitespace-pre-wrap font-sans">
            {budgetResult.answer}
          </pre>
        </div>
      )}

      {/* Optimize Result */}
      {optimizeResult && (
        <div className="mt-6 bg-purple-50 border border-purple-200 rounded-xl p-5">
          <h3 className="font-semibold text-purple-900 mb-2">AI Cart Optimization</h3>
          <pre className="text-sm text-purple-800 whitespace-pre-wrap font-sans">
            {optimizeResult.answer}
          </pre>
          {optimizeResult.sources && optimizeResult.sources.length > 0 && (
            <p className="text-xs text-purple-500 mt-3">
              Sources: {optimizeResult.sources.join(', ')}
            </p>
          )}
        </div>
      )}
    </div>
  );
}
