import { Router } from "express";
import rutaFactura from "./routes.factura";

const ruta = Router();

ruta.use("/api",rutaFactura);

export default ruta;