import { environment } from '../environments/environment';
import { join } from 'path';

const getPath = () => environment.production ? process.cwd() : join(process.cwd(), 'dist');

export const ssrPath = getPath();