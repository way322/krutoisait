// routes/cart.js
import { Router } from 'express';
import cartController from '../controllers/cartController.js'; // Добавлен импорт контроллера
import authMiddleware from '../middleware/auth.js';

const router = Router();
router.use(authMiddleware);

router.get('/', cartController.getCart);
router.post('/add', cartController.addToCart);
router.delete('/:productId', cartController.removeFromCart);
router.patch('/:productId/decrement', cartController.decrementQuantity);
router.delete('/clear', cartController.clearCart); // Добавлен если нужно

export default router;