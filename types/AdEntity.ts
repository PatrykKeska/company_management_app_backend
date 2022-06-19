export interface AdEntityPlace {
    id: string;
    name: string;
    city: string;
    street: string;
    buildNumber: number;
    img?: string;

}

export interface AdEntityItem {
    id: string;
    name: string;
    price: number;
    pieces: number;
    dateOfBuy: string;
    img?: string;

}