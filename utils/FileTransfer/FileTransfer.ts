
export const multer = require('multer')
// Transfer File
const storage = multer.diskStorage({
    destination: (req:any, res:any, cb:any) => {
        cb(null, 'public')
    },
    filename: ((req:any, file:any, cb:any) => {
        cb(null, Date.now() + '-' + file.originalname)
    })
});
export const upload = multer({storage}).single('file');