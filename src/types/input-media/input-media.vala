namespace Telegram {
    
    public struct InputFile {
        string name;
        string filename;
        Bytes body;
    }
    
    protected interface InputMedia : Object, Serializable {
        public abstract bool has_attachments();
        public abstract async InputFile[] append(int index) throws Error;
    }
}
