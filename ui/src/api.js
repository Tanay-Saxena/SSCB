import axios from 'axios';

const backend = axios.create({ baseURL: '/api' });
const ai = axios.create({ baseURL: '' });

export const api = {
  // Products
  getProducts: (category) =>
    backend.get('/products', { params: category ? { category } : {} }).then((r) => r.data),
  searchProducts: (query) =>
    backend.get('/products/search', { params: { query } }).then((r) => r.data),
  getProduct: (id) => backend.get(`/products/${id}`).then((r) => r.data),
  getProductVendors: (id) => backend.get(`/products/${id}/vendors`).then((r) => r.data),
  getProductReviews: (id) => backend.get(`/products/${id}/reviews`).then((r) => r.data),

  // Vendors
  getVendors: () => backend.get('/vendors').then((r) => r.data),
  getVendor: (id) => backend.get(`/vendors/${id}`).then((r) => r.data),
  getVendorPolicies: (id) => backend.get(`/vendors/${id}/policies`).then((r) => r.data),

  // Cart
  getCart: (id) => backend.get(`/carts/${id}`).then((r) => r.data),

  // AI
  productQA: (query) => ai.post('/ai/product-qa', { query }).then((r) => r.data),
  productComparison: (query) =>
    ai.post('/ai/product-comparison', { query }).then((r) => r.data),
  cartOptimization: (cartId, query) =>
    ai.post('/ai/cart-optimization', { cart_id: cartId, query }).then((r) => r.data),
  budgetCheck: (cartId) =>
    ai.post('/ai/budget-check', { cart_id: cartId }).then((r) => r.data),
};
