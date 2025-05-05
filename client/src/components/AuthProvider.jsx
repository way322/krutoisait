// components/AuthProvider.jsx
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { syncCart, initializeCart, clearCartDB,addToCartDB  } from '../store/cartSlice';

const AuthProvider = ({ children }) => {
  const dispatch = useDispatch();
  const { isAuthenticated, token } = useSelector(state => state.auth);
  const cart = useSelector(state => state.cart);

  // Инициализация корзины при загрузке
  useEffect(() => {
    dispatch(initializeCart());
  }, [dispatch]);

  // Синхронизация при изменении статуса аутентификации
  useEffect(() => {
    const handleAuthChange = async () => {
      if (isAuthenticated) {
        try {
          await dispatch(syncCart()).unwrap();
          
          const localCart = JSON.parse(localStorage.getItem('cart'));
          if (localCart?.items?.length > 0) {
            // Добавляем проверку существования товаров перед добавлением
            const validItems = await Promise.all(
              localCart.items.map(async item => {
                try {
                  await dispatch(addToCartDB(item)).unwrap();
                  return true;
                } catch (error) {
                  console.error('Failed to add item:', item.id, error);
                  return false;
                }
              })
            );
            
            // Удаляем только успешно добавленные товары
            if (validItems.every(Boolean)) {
              localStorage.removeItem('cart');
            }
          }
        } catch (error) {
          console.error('Auth change sync error:', error);
          // Сохраняем локальную корзину при ошибке синхронизации
          localStorage.setItem('cart', JSON.stringify(cart));
        }
      } else {
        localStorage.setItem('cart', JSON.stringify(cart));
      }
    };
    handleAuthChange();
  }, [isAuthenticated, token, dispatch]);

  // Автосохранение при изменении корзины
  useEffect(() => {
    let debounceTimer;
    
    const saveCart = async () => {
      try {
        if (isAuthenticated) {
          await dispatch(syncCart()).unwrap();
        }
      } catch (error) {
        console.error('Auto-save error:', error);
        localStorage.setItem('cart', JSON.stringify(cart));
      }
    };
  
    if (isAuthenticated && cart.status === 'succeeded') {
      debounceTimer = setTimeout(saveCart, 1000);
    }
  
    return () => {
      if (debounceTimer) clearTimeout(debounceTimer);
    };
  }, [cart.items, isAuthenticated, dispatch]);

  // Сохранение перед закрытием
  useEffect(() => {
    const handleBeforeUnload = async () => {
      if (isAuthenticated) {
        await dispatch(syncCart());
      } else if (cart.items.length > 0) {
        localStorage.setItem('cart', JSON.stringify(cart));
      }
    };

    window.addEventListener('beforeunload', handleBeforeUnload);
    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload);
    };
  }, [isAuthenticated, cart, dispatch]);

  return children;
};

export default AuthProvider;