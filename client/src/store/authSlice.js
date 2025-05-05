// src/store/authSlice.js
import { createSlice } from '@reduxjs/toolkit';
import { clearCartDB } from './cartSlice';

const authSlice = createSlice({
  name: 'auth',
  initialState: {
    user: null,
    token: null,
    isAuthenticated: false,
    loading: false,
    error: null
  },
  reducers: {
    loginStart(state) {
      state.loading = true;
      state.error = null;
    },
    loginSuccess(state, action) {
      state.user = action.payload.user;
      state.token = action.payload.token;
      state.isAuthenticated = true;
      state.loading = false;
      state.error = null;
    },
    loginFailure(state, action) {
      state.loading = false;
      state.error = action.payload;
    },
    registerStart(state) {
      state.loading = true;
      state.error = null;
    },
    registerSuccess(state, action) {
      state.user = action.payload.user;
      state.token = action.payload.token;
      state.isAuthenticated = true;
      state.loading = false;
      state.error = null;
    },
    registerFailure(state, action) {
      state.loading = false;
      state.error = action.payload;
    },
    logout(state) {
      state.user = null;
      state.token = null;
      state.isAuthenticated = false;
      state.loading = false;
      state.error = null;
      clearCartDB();
    }
    
  },
  extraReducers: (builder) => {
    builder
      .addCase(clearCartDB.rejected, (state) => {
        console.error('Ошибка очистки корзины при выходе');
      });
  }
});

export const { 
  loginStart,
  loginSuccess,
  loginFailure,
  registerStart,
  registerSuccess,
  registerFailure,

} = authSlice.actions;

export const { logout } = authSlice.actions;
export default authSlice.reducer;