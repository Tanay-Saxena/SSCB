import { useState, useEffect } from 'react';
import { api } from '../api';

export default function VendorsPage() {
  const [vendors, setVendors] = useState([]);
  const [selectedVendor, setSelectedVendor] = useState(null);
  const [policies, setPolicies] = useState(null);
  const [loading, setLoading] = useState(true);
  const [policyLoading, setPolicyLoading] = useState(false);

  useEffect(() => {
    api
      .getVendors()
      .then(setVendors)
      .catch((err) => console.error(err))
      .finally(() => setLoading(false));
  }, []);

  const viewPolicies = async (vendor) => {
    setSelectedVendor(vendor);
    setPolicyLoading(true);
    try {
      const data = await api.getVendorPolicies(vendor.id);
      setPolicies(data);
    } catch {
      setPolicies(null);
    } finally {
      setPolicyLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="animate-pulse space-y-4">
        <div className="h-8 bg-gray-200 rounded w-1/4" />
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="h-48 bg-gray-200 rounded-xl" />
          ))}
        </div>
      </div>
    );
  }

  return (
    <div>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Vendors</h1>
        <p className="text-gray-500 mt-1">
          {vendors.length} verified vendor{vendors.length !== 1 ? 's' : ''} on our marketplace
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {vendors.map((vendor) => (
          <div
            key={vendor.id}
            className={`bg-white rounded-xl border p-6 transition-all ${
              selectedVendor?.id === vendor.id
                ? 'border-indigo-300 shadow-md ring-1 ring-indigo-100'
                : 'border-gray-200 hover:border-gray-300 hover:shadow-sm'
            }`}
          >
            <div className="flex items-start justify-between mb-3">
              <div>
                <h3 className="text-lg font-semibold text-gray-900">{vendor.name}</h3>
                <p className="text-sm text-gray-500">
                  Member since{' '}
                  {new Date(vendor.created_at).toLocaleDateString('en-US', {
                    year: 'numeric',
                    month: 'long',
                  })}
                </p>
              </div>
              <div className="w-12 h-12 bg-gradient-to-br from-indigo-100 to-purple-100 rounded-xl flex items-center justify-center text-xl font-bold text-indigo-600">
                {vendor.name.charAt(0)}
              </div>
            </div>

            <p className="text-gray-600 text-sm mb-4">{vendor.description}</p>

            <button
              onClick={() => viewPolicies(vendor)}
              className="text-sm text-indigo-600 hover:text-indigo-800 font-medium cursor-pointer"
            >
              View Policies
            </button>

            {/* Policies */}
            {selectedVendor?.id === vendor.id && (
              <div className="mt-4 pt-4 border-t border-gray-100">
                {policyLoading ? (
                  <div className="animate-pulse space-y-2">
                    <div className="h-4 bg-gray-200 rounded w-2/3" />
                    <div className="h-4 bg-gray-200 rounded w-1/2" />
                  </div>
                ) : policies ? (
                  <div className="grid grid-cols-3 gap-4">
                    <PolicyCard
                      label="Returns"
                      value={`${policies.return_policy_days} days`}
                      color="green"
                    />
                    <PolicyCard
                      label="Exchange"
                      value={`${policies.exchange_policy_days} days`}
                      color="blue"
                    />
                    <PolicyCard
                      label="Cancel Window"
                      value={`${policies.cancellation_window_hours}h`}
                      color="amber"
                    />
                  </div>
                ) : (
                  <p className="text-sm text-gray-500">No policy data available.</p>
                )}
              </div>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}

function PolicyCard({ label, value, color }) {
  const colors = {
    green: 'bg-green-50 text-green-700 border-green-200',
    blue: 'bg-blue-50 text-blue-700 border-blue-200',
    amber: 'bg-amber-50 text-amber-700 border-amber-200',
  };

  return (
    <div className={`rounded-lg border p-3 text-center ${colors[color]}`}>
      <p className="text-xs font-medium opacity-75">{label}</p>
      <p className="text-lg font-bold">{value}</p>
    </div>
  );
}
