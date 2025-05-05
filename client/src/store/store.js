// src/store/store.js
import { configureStore } from '@reduxjs/toolkit';
import cartReducer from './cartSlice';
import orderReducer from './orderSlice';
import authReducer from './authSlice'; 
import favoritesReducer from './favoritesSlice';
import productsReducer from './productsSlice';

export default configureStore({
  reducer: {
    cart: cartReducer,
    orders: orderReducer,
    auth: authReducer ,
    favorites: favoritesReducer,
    products: productsReducer,
  }
});