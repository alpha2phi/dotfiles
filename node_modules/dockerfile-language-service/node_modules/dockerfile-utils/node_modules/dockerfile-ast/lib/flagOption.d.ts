import { Range } from 'vscode-languageserver-types';
export declare class FlagOption {
    private readonly range;
    private readonly name;
    private readonly nameRange;
    private readonly value;
    private readonly valueRange;
    constructor(range: Range, name: string, nameRange: Range, value: string | null, valueRange: Range | null);
    toString(): string;
    getRange(): Range;
    getName(): string;
    getNameRange(): Range;
    getValue(): string | null;
    getValueRange(): Range | null;
}
